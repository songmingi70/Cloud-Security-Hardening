# Cloud-Security-Hardening

# 🛡️ AWS 기반 클라우드 서버 구축 및 보안 요새화 (Hardening)

AWS EC2 인스턴스를 기반으로 심층 방어(Defense in Depth) 아키텍처를 설계하고, 자동 침입 차단 및 실시간 관제 시스템을 구축한 프로젝트입니다.
<img width="787" height="577" alt="1" src="https://github.com/user-attachments/assets/b0c90a9f-5b55-44a2-9b99-ce81e1fb6417" />

## 1. 개요
* **목표:** 외부 공격으로부터 안전한 클라우드 웹 서비스 환경 구축
* **핵심 성과:** 무차별 대입 공격(Brute-force) 자동 차단 및 실시간 보안 모니터링 체계 수립

## 2. 기술 스택
* **Infrastructure:** AWS (EC2, Security Group)
* **OS:** Ubuntu 24.04 LTS
* **Web Server:** Nginx (HTTPS 적용)
* **Security:** Fail2Ban (IPS/IDS), UFW (OS Firewall), OpenSSL
* **Monitoring:** Netdata (Real-time Observability)

## 3. 주요 보안 구현 내용

### 🔒 계층형 방어 및 서비스 보안
* **최소 권한 원칙:** AWS 보안 그룹을 활용하여 서비스에 필요한 최소 포트만 개방.
* **HTTPS 통신:** OpenSSL로 인증서를 발행하고 Nginx 설정을 통해 모든 HTTP 요청을 HTTPS(443)로 강제 리다이렉트(301 Redirect).

### 🚫 침입 경로 차단 및 자동 방어 (Hardening)
* **SSH 요새화:** 기본 22번 포트를 **2222번**으로 변경하여 자동화 스캔 공격의 90% 이상 회피. (Ubuntu 24.04 `ssh.socket` 유닛 설정 적용)
* **Fail2Ban 도입:** `/var/log/auth.log`를 실시간 분석하여 **5회 로그인 실패 시 해당 IP를 1시간 동안 즉시 차단**.

<img width="426" height="44" alt="스크린샷_2026-03-10_오전_1 38 18" src="https://github.com/user-attachments/assets/62239fc2-2a33-44fe-9170-fb8ca6fbc70a" />

<img width="514" height="184" alt="스크린샷_2026-03-10_오전_1 51 38" src="https://github.com/user-attachments/assets/709a7714-99d9-465f-af35-7b2e3ca4300f" />


### 📊 실시간 관제 및 가시성 (Observability)
* **Netdata 구축:** 텍스트 로그 중심에서 벗어나 대시보드 기반의 실시간 트래픽 및 자원 모니터링 체계 구축.
* **이점:** 네트워크 인터페이스의 Inbound 트래픽과 시스템 부하를 시각적으로 파악하여 이상 징후 조기 탐지.

## 4. 트러블슈팅 및 배운 점
* **네트워크 계층 분석:** HTTPS 설정 후 접속 실패 문제를 `curl`과 보안 그룹 설정을 통해 해결하며, 인프라의 단계별 점검(Layered Troubleshooting) 중요성을 체득.
* **방어적 설정의 필수성:** 서버 가동 직후 발생하는 수천 건의 외부 봇 공격 로그를 직접 확인하며 실무적인 보안 감각 함양.

---
*본 프로젝트는 실무 수준의 클라우드 보안 운영 역량 강화를 위해 진행되었습니다.*
