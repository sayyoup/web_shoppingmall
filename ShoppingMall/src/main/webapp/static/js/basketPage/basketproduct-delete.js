/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {

	//각 상품마다 있는 삭제버튼
	const deleteForm = document.querySelector('#deleteForm');
	const btnDeletes = document.querySelectorAll('#btnDelete');
	btnDeletes.forEach((btn) => {
		btn.addEventListener('click', () => {
			const id = btn.getAttribute('data-id');
			const check = confirm('정말 삭제할까요?');
			if (check) {
				deleteForm.action = './deleteProduct?id=' + id;
				deleteForm.method = 'post';
				deleteForm.submit();
			}
		});
	});
	
		
});
	







