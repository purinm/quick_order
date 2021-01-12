const check = ()=> {
  document.querySelector('button').addEventListener('click', () => {
    // どのインプットのチェックがついたか？
    const inputs = document.querySelectorAll('input');
    inputs.forEach (function(input){
        if (input.checked === true) {
          input.disabled = true;
          const row = input.parentNode.parentNode;
          row.classList.add("checked");  
        };
    });
  });
   
};
window.addEventListener("load", check);