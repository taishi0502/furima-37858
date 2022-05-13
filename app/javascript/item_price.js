window.addEventListener('load', () => {
  

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  




  const itemTax = document.getElementById("add-tax-price");
  itemTax.innerHTML = (Math.floor(inputValue * 0.1));
  console.log(itemTax);





  const itemProfit = document.getElementById("profit");
  const value_result = inputValue * 0.1
    console.log(value_result)
  itemProfit.innerHTML = (Math.floor(inputValue - value_result));
  console.log(itemProfit);
  

  })

});

