import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///用到这个库，最早的需求是要解析word文档，注意是word格式的字串
///而不是word的url
///如果是针对的文件，可以用到pdftron_flutter 或者 flutter_firereader
///我试了下pdftron_flutter，方法超级多，很臃肿，编译直接10几个万方法
class TagsParserTest extends StatefulWidget {
  const TagsParserTest({Key? key}) : super(key: key);

  @override
  State<TagsParserTest> createState() => _TagsParserTestState();
}

class _TagsParserTestState extends State<TagsParserTest> {
  String oriStr = '''
  <p><!--[if gte mso 9]><xml> </xml><![endif]--></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>用户进入小程序后通过首页定位及选择定位到租户，选择租户后则确定租户下党建中心展示内容，用户手机号和党员管理中党员手机号信息做匹配，</font><b><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';color:rgb(255,0,0);="" font-weight:bold;font-size:10.5000pt;"=""><font>只有用户手机号在党员管理的信息中才可以产看，三会一课，民主生活会，党员通讯录三个功能。如果非党员点击则</font><font>toast</font><font>提示，“仅认证的党员可查看”。</font></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></b><b><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';color:rgb(255,0,0);font-weight:bold;="" font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></b></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><h5><b><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-weight:bold;="" font-size:14.0000pt;"=""><font>功能说明</font></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></b><b><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-weight:bold;font-size:14.0000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></b></h5><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>查询字段：</font><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>组织名称：模糊搜索</font> <spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;&nbsp;<spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>不限制输入</font> <spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;&nbsp;<spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>党组织名称</font><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>姓名：模糊搜索</font> <spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;&nbsp;<spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>不限制输入</font> <spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;&nbsp;&nbsp;<spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>对应党员姓名</font><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>联系方式：模糊搜索</font> <spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;<spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>不限制输入</font> <spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;&nbsp;<spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>对应联系方式</font><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><p class="MsoNormal"><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"="">&nbsp;</spanyes';font-family:calibri;mso-fareast-font-family:宋体;></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>年龄计算：由当前日期</font><font>——出生日期计算年龄</font><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><!--[if gte mso 9]><xml> </xml><![endif]--></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p><p class="MsoNormal"><spanyes';font-family:宋体;mso-ascii-font-family:calibri; mso-hansi-font-family:calibri;mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""><font>页面排序和搜索结果按照党员姓名拼音</font><font>A-Z</font><font>排序</font><spanyes';font-family:calibri;mso-fareast-font-family:宋体; mso-bidi-font-family:'times="" new="" roman';font-size:10.5000pt;"=""></spanyes';font-family:calibri;mso-fareast-font-family:宋体;></spanyes';font-family:宋体;mso-ascii-font-family:calibri;></p>
  ''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('origin '),
          Text(oriStr),
          Text('After '),
          HtmlWidget(oriStr),
        ],
      ),
    );
  }
}