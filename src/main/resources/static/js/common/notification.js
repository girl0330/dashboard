document.addEventListener("DOMContentLoaded", () => {
	const startSse = () => {
		const eventSource = new EventSource('/api/v1/notification/subscribe');

		eventSource.onmessage = event => {
			alert("Notification: " + event.data);
		};

		eventSource.addEventListener('notification', event => {
			console.log("Notification: " + event.data);
		});

		eventSource.onerror = event => {
			console.error("EventSource failed: ", event);
			eventSource.close();
			// 연결이 실패하면 5초 후에 다시 연결을 시도합니다.
			setTimeout(startSse, 5000);
		};

		// 페이지를 닫거나 새로고침할 때 연결 해지
		window.addEventListener("beforeunload", () => {
			eventSource.close();
		});
	}

	if (sessionStorage.getItem("LoginCheck")) {
		startSse(); // 최초 연결 시도
	}
});