class AddBookingModel {
  final String service;
  final DateTime bookingDate;
  final DateTime from;
  final DateTime to;
  final String staff;

  AddBookingModel(
      this.service, this.bookingDate, this.from, this.to, this.staff);
}
