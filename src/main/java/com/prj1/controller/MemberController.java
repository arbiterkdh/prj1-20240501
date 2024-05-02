package com.prj1.controller;


import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {

    private final MemberService service;

    @GetMapping("sign-up")
    public String signUpForm() {
        return "member/sign-up";
    }

    @PostMapping("sign-up")
    public String signUpPost(Member member) {
        service.signUp(member);
        return "redirect:/";
    }

    @GetMapping("list")
    public String list(Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("")
    public String info(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        return "member/info";
    }

    @PostMapping("remove")
    public String remove(Integer id) {
        service.remove(id);
        return "redirect:/member/sign-up";
    }

    @GetMapping("modify")
    public void modifyForm(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
    }

    @PostMapping("modify")
    public String modifyPost(Member member, RedirectAttributes rttr) {
        service.modify(member);

        rttr.addAttribute("id", member.getId());
        return "redirect:/member";
    }
}
