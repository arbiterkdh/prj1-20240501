package com.prj1.mapper;

import com.prj1.domain.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member
            (email, password, nick_name)
            VALUES (#{email}, #{password}, #{nickName})
            """)
    int insert(Member member);

    @Select("""
            SELECT *
            FROM member
            ORDER BY id DESC
            """)
    List<Member> selectAll();

    @Select("""
            SELECT m.id, email, password, nick_name, inserted, name
            FROM member m
            LEFT JOIN authority a ON m.id = a.member_id
            WHERE m.id = #{id}
            """)
    Member selectById(Integer id);

    @Delete("""
            DELETE 
            FROM member
            WHERE id = #{id}
            """)
    void deleteById(Integer id);

    @Update("""
            UPDATE member
            SET    password = #{password},
                   nick_name = #{nickName}
            WHERE id = #{id}
            """)
    int update(Member member);

    @Select("""
            SELECT * FROM member
            WHERE email = #{email}
            """)
    Member selectByEmail(String email);

    @Select("""
            SELECT name
            FROM authority
            WHERE member_id = #{memberId}
            """)
    List<String> selectAuthorityByMemberId(Integer memberId);
}
