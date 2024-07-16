
// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)


//  document.addEventListener('DOMContentLoaded', (event) => {
//     const arrivalDateInput = document.getElementById('arrival-date');
//     const departureDateInput = document.getElementById('departure-date');
//     const nightCountSpan = document.getElementById('night-count');
//     const cleaningFeeTotalSpan = document.getElementById('cleaning-fee-total');
//     const totalCostSpan = document.getElementById('total-cost');
//     // const apartmentPrice = apartment.price.to_json.html_safe ;
//     // const cleaningFee = cleaning_fee.to_json.html_safe;
  
//     // function updateCost() {
//     //   const arrivalDate = new Date(arrivalDateInput.value);
//     //   const departureDate = new Date(departureDateInput.value);
//     //   const timeDifference = departureDate - arrivalDate;
//     //   const nightCount = Math.ceil(timeDifference / (1000 * 3600 * 24));
  
//     //   if (nightCount > 0) {
//     //     nightCountSpan.textContent = nightCount;
//     //     cleaningFeeTotalSpan.textContent = numberToCurrency(cleaningFee * nightCount);
//     //     totalCostSpan.textContent = numberToCurrency(apartmentPrice * nightCount + cleaningFee);
//     //   } else {
//     //     nightCountSpan.textContent = 0;
//     //     cleaningFeeTotalSpan.textContent = numberToCurrency(0);
//     //     totalCostSpan.textContent = numberToCurrency(0);
//     //   }
//     // }
  
//     function numberToCurrency(number) {
//       return new Intl.NumberFormat('ru-RU', { style: 'currency', currency: 'EUR' }).format(number);
//     }
  
//     // arrivalDateInput.addEventListener('change', updateCost);
//     // departureDateInput.addEventListener('change', updateCost);
  
//     // updateCost();
//   });


  
 