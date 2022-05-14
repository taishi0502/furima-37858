window.addEventListener('load', () => {
  

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    

  const itemTax = document.getElementById("add-tax-price");
  itemTax.innerHTML = (Math.floor(inputValue * 0.1));
 

  const itemProfit = document.getElementById("profit");
  const value_result = inputValue * 0.1
    
  itemProfit.innerHTML = (Math.floor(inputValue - value_result));
  
  
  })

});

