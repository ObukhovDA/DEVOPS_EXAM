const modal = document.getElementById('deleteModal');

modal.addEventListener('show.bs.modal', function (event) {
    let phone_number = document.getElementById('phone').value;
    this.querySelector('.phone-number').textContent = phone_number;
    this.querySelector('#phone_number').value = phone_number;
});