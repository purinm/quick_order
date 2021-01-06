const check = ()=> {
  document.querySelector('button').addEventListener('click', () => {
    const boxes = document.querySelectorAll('input');
  
      boxes.forEach(box => {
        if (box.checked === true) {
          box.disabled = true;
          };
      });
  });
};
window.addEventListener("load", check);