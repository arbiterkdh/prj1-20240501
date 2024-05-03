package com.prj1.service;

import com.prj1.domain.Board;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardService {

    private final BoardMapper mapper;

    public void add(Board board) {
        mapper.insert(board);
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }

    public List<Board> list() {
        return mapper.selectAll();
    }

    public void remove(Integer id) {
        mapper.deletById(id);
    }

    public void modify(Board board) {
        mapper.update(board);
    }

    public Map<String, Object> list(Integer page) {
        int offset = (page - 1) * 10;
        return Map.of("board", mapper.selectAllByPage(offset));
    }
}
