class UserModel {
  String ret;
  String msg;
  Element element;

  UserModel({this.ret, this.msg, this.element});

  UserModel.fromJson(Map<String, dynamic> json) {
    ret = json['ret'];
    msg = json['msg'];
    element =
    json['element'] != null ? new Element.fromJson(json['element']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ret'] = this.ret;
    data['msg'] = this.msg;
    if (this.element != null) {
      data['element'] = this.element.toJson();
    }
    return data;
  }
}

class Element {
  String mobile;
  String password;
  String token;
  String userid;
  String username;
  String picurl;
  String sex;
  String homeadr;
  Null comadr;
  String idcard;
  String repairstation;
  Null userpic;
  String idpicurl;
  String ischeck;
  String ability;
  String channelid;
  String adminid;
  String domain;
  String groupid;
  String mainviewflag;
  String changeright;
  String cancelright;
  String createright;
  String rejectright;
  String province;
  String payright;
  String companyid;
  int installflag;
  List<Rightlist> rightlist;
  String partright;
  String role;
  Splash splash;
  String insuranceurl;
  String trainingurl;
  String level;
  bool issale;
  int personnelflag;
  List<int> modelflag;
  int dispatchflag;

  Element(
      {this.mobile,
        this.password,
        this.token,
        this.userid,
        this.username,
        this.picurl,
        this.sex,
        this.homeadr,
        this.comadr,
        this.idcard,
        this.repairstation,
        this.userpic,
        this.idpicurl,
        this.ischeck,
        this.ability,
        this.channelid,
        this.adminid,
        this.domain,
        this.groupid,
        this.mainviewflag,
        this.changeright,
        this.cancelright,
        this.createright,
        this.rejectright,
        this.province,
        this.payright,
        this.companyid,
        this.installflag,
        this.rightlist,
        this.partright,
        this.role,
        this.splash,
        this.insuranceurl,
        this.trainingurl,
        this.level,
        this.issale,
        this.personnelflag,
        this.modelflag,
        this.dispatchflag});

  Element.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
    token = json['token'];
    userid = json['userid'];
    username = json['username'];
    picurl = json['picurl'];
    sex = json['sex'];
    homeadr = json['homeadr'];
    comadr = json['comadr'];
    idcard = json['idcard'];
    repairstation = json['repairstation'];
    userpic = json['userpic'];
    idpicurl = json['idpicurl'];
    ischeck = json['ischeck'];
    ability = json['ability'];
    channelid = json['channelid'];
    adminid = json['adminid'];
    domain = json['domain'];
    groupid = json['groupid'];
    mainviewflag = json['mainviewflag'];
    changeright = json['changeright'];
    cancelright = json['cancelright'];
    createright = json['createright'];
    rejectright = json['rejectright'];
    province = json['province'];
    payright = json['payright'];
    companyid = json['companyid'];
    installflag = json['installflag'];
    if (json['rightlist'] != null) {
      rightlist = new List<Rightlist>();
      json['rightlist'].forEach((v) {
        rightlist.add(new Rightlist.fromJson(v));
      });
    }
    partright = json['partright'];
    role = json['role'];
    splash =
    json['splash'] != null ? new Splash.fromJson(json['splash']) : null;
    insuranceurl = json['insuranceurl'];
    trainingurl = json['trainingurl'];
    level = json['level'];
    issale = json['issale'];
    personnelflag = json['personnelflag'];
    modelflag = json['modelflag'].cast<int>();
    dispatchflag = json['dispatchflag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['token'] = this.token;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['picurl'] = this.picurl;
    data['sex'] = this.sex;
    data['homeadr'] = this.homeadr;
    data['comadr'] = this.comadr;
    data['idcard'] = this.idcard;
    data['repairstation'] = this.repairstation;
    data['userpic'] = this.userpic;
    data['idpicurl'] = this.idpicurl;
    data['ischeck'] = this.ischeck;
    data['ability'] = this.ability;
    data['channelid'] = this.channelid;
    data['adminid'] = this.adminid;
    data['domain'] = this.domain;
    data['groupid'] = this.groupid;
    data['mainviewflag'] = this.mainviewflag;
    data['changeright'] = this.changeright;
    data['cancelright'] = this.cancelright;
    data['createright'] = this.createright;
    data['rejectright'] = this.rejectright;
    data['province'] = this.province;
    data['payright'] = this.payright;
    data['companyid'] = this.companyid;
    data['installflag'] = this.installflag;
    if (this.rightlist != null) {
      data['rightlist'] = this.rightlist.map((v) => v.toJson()).toList();
    }
    data['partright'] = this.partright;
    data['role'] = this.role;
    if (this.splash != null) {
      data['splash'] = this.splash.toJson();
    }
    data['insuranceurl'] = this.insuranceurl;
    data['trainingurl'] = this.trainingurl;
    data['level'] = this.level;
    data['issale'] = this.issale;
    data['personnelflag'] = this.personnelflag;
    data['modelflag'] = this.modelflag;
    data['dispatchflag'] = this.dispatchflag;
    return data;
  }
}

class Rightlist {
  int action;
  String title;
  String url;

  Rightlist({this.action, this.title, this.url});

  Rightlist.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class Splash {
  Null picurl;
  String eventurl;
  Null eventtitle;
  int deaddate;
  Null status;
  int duration;

  Splash(
      {this.picurl,
        this.eventurl,
        this.eventtitle,
        this.deaddate,
        this.status,
        this.duration});

  Splash.fromJson(Map<String, dynamic> json) {
    picurl = json['picurl'];
    eventurl = json['eventurl'];
    eventtitle = json['eventtitle'];
    deaddate = json['deaddate'];
    status = json['status'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picurl'] = this.picurl;
    data['eventurl'] = this.eventurl;
    data['eventtitle'] = this.eventtitle;
    data['deaddate'] = this.deaddate;
    data['status'] = this.status;
    data['duration'] = this.duration;
    return data;
  }
}