/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class ServiceTileItem {
  final String serviceIcon;
  final String serviceName;

  ServiceTileItem(this.serviceIcon, this.serviceName);
}

class CommonTileItem {
  final String tileIcon;
  final String tileName;

  CommonTileItem(this.tileIcon, this.tileName);
}

class NewsItem {
  String dateTime; //日期
  String title; //标题
  String content; //正文
  String thumbnails;

  NewsItem(this.title, this.content, this.dateTime, this.thumbnails) {}
}
