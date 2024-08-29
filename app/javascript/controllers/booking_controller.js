import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkIn", "checkOut", "price", "pricePerDay"];

  connect() {
    console.log();
  }

  updateDates() {
    const checkInDate = this.checkInTarget.value;
    const checkOutDate = this.checkOutTarget.value;

    if (checkInDate && checkOutDate) {
      if (new Date(checkInDate) > new Date(checkOutDate)) {
        price.innerText = "The date is not correct";
        return;
      }
      this.calculatePrice(checkInDate, checkOutDate);
    }
  }
  calculatePrice(checkIn, checkOut) {
    const price = this.calculatePlaceholderPrice(checkIn, checkOut);
    this.priceTarget.textContent = `Your price: $${price}`;
  }

  calculatePlaceholderPrice(checkIn, checkOut) {
    const start = new Date(checkIn);
    const end = new Date(checkOut);
    const days = Math.abs(end - start) / (1000 * 60 * 60 * 24);
    return days * pricePerDay.innerText; // Assuming $100 per day
  }
}
