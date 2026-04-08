---
type: concept
domain: "웹 개발"
name: "Socket.IO와 실시간 통신"
sources: ["/1832"]
updated: "2026-04-07"
---
# Socket.IO와 실시간 통신

**WebSocket**은 클라이언트와 서버 간의 **양방향 통신**을 가능하게 하는 프로토콜이다. 기존 HTTP가 요청-응답의 단방향이었다면, WebSocket은 연결 수립 후 양쪽이 자유롭게 데이터를 주고받을 수 있다. **Socket.IO**는 WebSocket을 기반으로 더 다양한 기능을 제공하는 라이브러리다.

## Socket.IO의 주요 특징

- **자동 재연결**: 연결 끊김 시 자동 재시도
- **폴백 메커니즘**: WebSocket 미지원 환경에서는 polling으로 자동 전환
- **룸과 네임스페이스**: 특정 그룹에만 메시지 전송 가능
- **이벤트 기반 통신**: 커스텀 이벤트 정의·처리

## Next.js + TypeScript 환경 구현 예시

```ts
// hooks/useSocket.ts
import { io, Socket } from 'socket.io-client';
export const useSocket = () => {
  const socket = useRef<Socket | null>(null);
  useEffect(() => {
    socket.current = io('http://localhost:3000', { path: '/api/socketio' });
    socket.current.on('connect', () => console.log('소켓 연결 성공!'));
    return () => socket.current?.disconnect();
  }, []);
  return socket.current;
};
```

서버 측은 Next.js API 라우트로 Socket.IO 서버를 초기화한다.

## 룸(Room)과 브로드캐스트

```ts
io.on('connection', (socket) => {
  // 룸 참여 — 채팅방·게임룸 같은 독립 공간
  socket.on('join_room', (roomId) => {
    socket.join(roomId);
    io.to(roomId).emit('user_joined', '새 사용자 참여');
  });
  // 특정 룸에만 메시지
  socket.on('room_message', ({ roomId, message }) => {
    io.to(roomId).emit('receive_room_message', message);
  });
  // 브로드캐스트 — 전체 알림
  socket.on('broadcast', (message) => {
    socket.broadcast.emit('receive_broadcast', message);
  });
});
```

## 에러 처리와 재연결

```ts
socket.current = io(URL, {
  reconnectionAttempts: 5,    // 최대 5번 재시도
  reconnectionDelay: 1000,    // 1초 간격
});
socket.current.on('connect_error', (err) => {
  toast.error('서버 연결에 실패했습니다.');
});
socket.current.on('reconnect_failed', () => {
  toast.error('연결이 불안정합니다. 새로고침해주세요.');
});
```

**타임아웃이 있는 메시지 전송**: `socket.timeout(5000).emit(event, data, callback)`로 응답이 5초 안에 오지 않으면 에러 처리.

## 성능 최적화

1. **이벤트 배칭**: 100ms 동안 메시지를 모았다가 한 번에 전송
2. **메시지 압축**: 대용량 데이터 전송 시 압축
3. **연결 최적화**: `transports: ['websocket']`, `upgrade: false`로 polling 단계를 건너뛰어 즉시 WebSocket으로 시작, `pingInterval`/`pingTimeout`으로 연결 상태 관리

## 핵심 내용
- WebSocket = 양방향 실시간 통신 프로토콜, HTTP 단방향의 한계 극복
- Socket.IO = WebSocket + 자동 재연결 + 폴백 + 룸 + 이벤트 기반 추상화
- **룸(Room)**: 채팅방·게임룸 같은 독립 그룹 메시지 전송
- **브로드캐스트**: 전체 사용자 대상 알림
- 재연결 전략, 타임아웃, 에러 핸들링이 안정적 운영의 핵심
- 성능 최적화: 이벤트 배칭 + 메시지 압축 + WebSocket 즉시 연결

## 관련 개념
- [[웹 아키텍처]] — HTTP·WebSocket 등 통신 프로토콜의 위치
- [[React 상태 관리]] — 실시간 데이터를 React 상태로 동기화
- [[Next.js 레이아웃과 템플릿]] — Next.js의 API 라우트와 클라이언트-서버 경계

## 출처
- [Socket.IO로 구현하는 실시간 양방향 통신](https://story.pxd.co.kr/1832) — bareum.park, UX Engineer 이야기
