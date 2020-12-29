window.addEventListener("load",()=>{
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price")
    const addTaxValue = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTaxValue;
    console.log(addTaxDom);
    
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue - addTaxValue));
      console.log(profitNumber);
      
});
})