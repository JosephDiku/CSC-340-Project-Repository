package com.CSC340.BookNexus.Member;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberService {

    private final MemberRepository memberRepository;

    public Member createMember(Member member) {
        if(memberRepository.existsByEmail(member.getEmail())) {
            throw new IllegalStateException("This email is already registered.");
        }
        return memberRepository.save(member);
    }

    public Member updateMember(Long memberId, Member memberDetails) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new EntityNotFoundException("Member not found"));

        if (!member.getEmail().equals(memberDetails.getEmail()) &&
            memberRepository.existsByEmail(memberDetails.getEmail())) {
            throw new IllegalStateException("This email is already registered.");
        }

        member.setName(memberDetails.getName());
        member.setEmail(memberDetails.getEmail());
        member.setPassword(memberDetails.getPassword());

        return memberRepository.save(member);
    }

    public void deleteMember(Long memberId) {
        if (!memberRepository.existsById(memberId)) {
            throw new EntityNotFoundException("Member not found");
        }
        memberRepository.deleteById(memberId);
    }

    public List<Member> getAllMembers() {
        return memberRepository.findAll();
    }

    public Member getMemberById(Long memberId) {
        return memberRepository.findById(memberId)
            .orElseThrow(() -> new EntityNotFoundException("Member not found"));
    }

    public List<Member> searchMembersByEmail(String email) {
        return memberRepository.findByEmailContaining(email);
    }

    public Member authenticate(String email, String password) {
        Member member = memberRepository.findByEmail(email)
            .orElseThrow(() -> new IllegalArgumentException("Invalid email or password"));

        if (!member.getPassword().equals(password)) {
            throw new IllegalArgumentException("Invalid email or password");
        }

        return member;
    }

}
