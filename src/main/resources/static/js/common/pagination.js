//[List page 생성]
function  renderPagination(containerId, currentPage, pageSize, totalJobs, totalPages) {
	const $container = $('#'+containerId);
	$container.empty();

	function createPageItem(page, text, disabled = false, active = false) {
		const classNames = 'page-item' + (disabled ? ' disabled' : '') + (active ? ' active' : '');
		const itemHtml = '<li class="' + classNames + '">' +
			'<a class="page-link b-radius-none" data-page="' + page + '">' + text + '</a>' +
			'</li>';
		$container.append(itemHtml);
	}

	// 전체 페이지가 0일 때 최소 1페이지로 설정
	if (totalPages === 0) {
		totalPages = 1;
	}

	const prevPage = currentPage > 1 ? currentPage - 1 : 1;
	const nextPage = currentPage < totalPages ? currentPage + 1 : totalPages;

	createPageItem(prevPage, 'Prev', currentPage === 1);

	const maxPageLinks = 5;
	let startPage = Math.floor((currentPage - 1) / maxPageLinks) * maxPageLinks + 1;
	let endPage = startPage + maxPageLinks - 1;

	if (endPage > totalPages) {
		endPage = totalPages;
	}

	if (startPage > 1) {
		createPageItem(startPage - 1, '...');
	}

	for (let i = startPage; i <= endPage; i++) {
		createPageItem(i, i, false, i === currentPage);
	}

	if (endPage < totalPages) {
		createPageItem(endPage + 1, '...');
	}

	createPageItem(nextPage, 'Next', currentPage === totalPages);
}