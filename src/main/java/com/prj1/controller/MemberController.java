package com.prj1.controller;


import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
        return "redirect:/member/login";
    }

    @GetMapping("list")
    @PreAuthorize("hasAuthority('admin')")
    public String list(Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("")
    public String info(Integer id, Authentication authentication, Model model) {
        if (service.hasAccess(id, authentication) ||
                service.isAdmin(authentication)) {
            model.addAttribute("member", service.get(id));
            return "member/info";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("remove")
    public String remove(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication))
            service.remove(id);
        return "redirect:/logout";
    }

    @GetMapping("modify")
    public void modifyForm(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
    }

    @PostMapping("modify")
    public String modifyPost(Member member, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(member.getId(), authentication)) {
            service.modify(member);
        }

        rttr.addAttribute("id", member.getId());
        return "redirect:/member";
    }

    @GetMapping("email")
    @ResponseBody // 모델에 담거나 view 로 해석하지 않고 바로 본문으로 리턴.
    public String emailCheck(String email) {
        String message = service.emailCheck(email);
        return message;
    }

    @GetMapping("login")
    public String login(Model model) {
        return "member/login";
    }
}
