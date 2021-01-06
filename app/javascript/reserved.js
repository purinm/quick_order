const check = ()=> {

  const boxes = document.getElementById('input[name="reserved-boxes"]');
  
  
  boxes.addEventListener('click',()=>{
    debugger;
    boxes.disabled = true;
    boxes.classList.add('reserved-boxes:read-only');
   });
  };
window.addEventListener("load", check);