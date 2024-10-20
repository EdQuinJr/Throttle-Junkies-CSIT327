function showLoginModal() {
    document.querySelector('.overlay').style.display = 'block';
    document.querySelector('.login-modal').style.display = 'block';
    document.querySelector('.signup-modal').style.display = 'none';
}

function hideLoginModal() {
    document.querySelector('.overlay').style.display = 'none';
    document.querySelector('.login-modal').style.display = 'none';
}

function showSignupModal() {
    document.querySelector('.overlay').style.display = 'block';
    document.querySelector('.signup-modal').style.display = 'block';
    document.querySelector('.login-modal').style.display = 'none';
}

function hideSignupModal() {
    document.querySelector('.overlay').style.display = 'none';
    document.querySelector('.signup-modal').style.display = 'none';
}

function hideModals() {
    hideLoginModal();
    hideSignupModal();
}

document.addEventListener("DOMContentLoaded", function () {
    function openSidebar() {
        document.getElementById("cartSidebar").style.width = "300px";
    }

    function closeSidebar() {
        document.getElementById("cartSidebar").style.width = "0";
    }

    // Attach functions to the global scope (for inline HTML usage)
    window.openSidebar = openSidebar;
    window.closeSidebar = closeSidebar;
});

let cart = [];

function addToCart(name, price) {
    const product = { name, price };
    cart.push(product);
    updateCart();
}

function updateCart() {
    const cartItemsContainer = document.querySelector('.cart-items');
    cartItemsContainer.innerHTML = ''; // Clear current items

    if (cart.length === 0) {
        cartItemsContainer.innerHTML = '<p>No items in the cart</p>';
        return;
    }

    cart.forEach((item, index) => {
        const itemElement = document.createElement('div');
        itemElement.className = 'cart-item';
        itemElement.innerHTML = `
            <p>${item.name} - $${item.price}</p>
            <a href="javascript:void(0)" class="remove-btn" onclick="removeFromCart(${index})">&times;</a>
        `;
        cartItemsContainer.appendChild(itemElement);
    });
    updateTotal();
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

function openSidebar() {
    document.getElementById('cartSidebar').style.width = '300px';
}

function closeSidebar() {
    document.getElementById('cartSidebar').style.width = '0';
}

function updateTotal() {
    let total = cart.reduce((sum, item) => sum + item.price, 0);
    document.getElementById('totalAmount').innerText = `$${total}`;
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

renderCart();

function checkout() {
    document.querySelector('.overlay').style.display = 'block';
    document.querySelector('.checkout-modal').style.display = 'block';
}

function proceedPayment() {
    const fullName = document.getElementById('full-name').value;
    const creditCard = document.getElementById('credit-card').value;

    if (fullName === '' || creditCard === '') {
        alert('Please fill in all fields.');
        return;
    }

    alert(`Payment successful for ${fullName} with card number ${creditCard}.`);

    cancelPayment();
}

function cancelPayment() {
    document.querySelector('.overlay').style.display = 'none';
    document.querySelector('.checkout-modal').style.display = 'none';
    document.getElementById('full-name').value = '';
    document.getElementById('credit-card').value = '';
}