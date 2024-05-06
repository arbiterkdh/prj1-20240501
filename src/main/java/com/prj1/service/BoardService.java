package com.prj1.service;

import com.prj1.domain.Board;
import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            board.setMemberId(member.getId());
            mapper.insert(board);
        }
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }

    public List<Board> list() {
        return mapper.selectAll();
    }

    public void remove(Integer id) {
        mapper.deleteById(id);
    }

    public void modify(Board board) {
        mapper.update(board);
    }

    public Map<String, Object> list(Integer page) {
        int offset = (page - 1) * 10;
        int beginPageNumber = (page - 1) / 10 * 10 + 1;
        int endPageNumber = beginPageNumber + 9;
        int cntPage = mapper.countAll();
        int lastPageNumber = (cntPage - 1) / 10 + 1;
        if (endPageNumber > lastPageNumber) endPageNumber = lastPageNumber;
        int prevPageNumber = beginPageNumber - 10;
        int nextPageNumber = beginPageNumber + 10;
        return Map.of("boardList", mapper.selectAllByPage(offset),
                "beginPageNumber", beginPageNumber,
                "endPageNumber", endPageNumber,
                "lastPageNumber", lastPageNumber,
                "prevPageNumber", prevPageNumber,
                "nextPageNumber", nextPageNumber,
                "currentPageNumber", page);
    }

    public boolean hasAccess(Integer id, Authentication authentication) {
        // 로그인 성공 못했다면 false
        if (authentication == null) {
            return false;
        }
        // 로그인 성공 시
        Board board = mapper.selectById(id);
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            return board.getMemberId().equals(member.getId());
        }
        return false;
    }
}
