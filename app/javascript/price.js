window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")
    
  priceInput.addEventListener('input', function(){
    const priceTax = document.getElementById("add-tax-price")
    const priceProfit = document.getElementById("profit")

    let price = priceInput.value
    let tax = price * 0.1
    priceTax.innerHTML = tax
    let profit = price - tax
    priceProfit.innerHTML = profit
  })
})
