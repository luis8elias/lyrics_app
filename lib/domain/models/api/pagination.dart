class Pagination {
  
  Pagination({
    required  this.currentPage,
    required  this.from,
    required  this.to,
    required  this.total,
    required  this.perPage,
    required  this.lastPage,
    required  this.firstPageUrl,
    required  this.lastPageUrl,
    this.prevPageUrl,
    this.nextPageUrl,
    required  this.path,
  });

  int currentPage;
  int from;
  int to;
  int total;
  int perPage;
  int lastPage;
  String firstPageUrl;
  String lastPageUrl;
  String? prevPageUrl;
  String? nextPageUrl;
  String path;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    from: json["from"],
    to: json["to"],
    total: json["total"],
    perPage: json["per_page"],
    lastPage: json["last_page"],
    firstPageUrl: json["first_page_url"],
    lastPageUrl: json["last_page_url"],
    prevPageUrl: json["prev_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "to": to,
    "total": total,
    "per_page": perPage,
    "last_page": lastPage,
    "first_page_url": firstPageUrl,
    "last_page_url": lastPageUrl,
    "prev_page_url": prevPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
  };
}
