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
