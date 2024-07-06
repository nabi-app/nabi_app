enum SignUpTermType {
  olderAge14(
    text: "만 14세 이상입니다 (필수)",
  ),
  serviceUsage(
    text: "서비스 이용약관 동의 (필수)",
    link: "",
  ),
  privacy(
    text: "개인정보 수집 방침 안내 (필수)",
    link: "",
  ),
  marketing(
    text: "이벤트 마케팅 수신 동의 (선택)",
    link: "",
  );

  final String text;
  final String? link;

  const SignUpTermType({required this.text, this.link});
}
