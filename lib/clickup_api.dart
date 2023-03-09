// To parse this JSON data, do
//
//     final clickUp = clickUpFromJson(jsonString);

import 'dart:convert';

ClickUp clickUpFromJson(String str) => ClickUp.fromJson(json.decode(str));

String clickUpToJson(ClickUp data) => json.encode(data.toJson());

class ClickUp {
  ClickUp({
    required this.info,
    required this.item,
    required this.auth,
    required this.event,
    required this.variable,
  });

  Info info;
  List<ClickUpItem> item;
  Auth auth;
  List<Event> event;
  List<Variable> variable;

  factory ClickUp.fromJson(Map<String, dynamic> json) => ClickUp(
        info: Info.fromJson(json["info"]),
        item: List<ClickUpItem>.from(
            json["item"].map((x) => ClickUpItem.fromJson(x))),
        auth: Auth.fromJson(json["auth"]),
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
        variable: List<Variable>.from(
            json["variable"].map((x) => Variable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "auth": auth.toJson(),
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
        "variable": List<dynamic>.from(variable.map((x) => x.toJson())),
      };
}

class Auth {
  Auth({
    required this.type,
    required this.apikey,
  });

  String type;
  List<Apikey> apikey;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        type: json["type"],
        apikey:
            List<Apikey>.from(json["apikey"].map((x) => Apikey.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "apikey": List<dynamic>.from(apikey.map((x) => x.toJson())),
      };
}

class Apikey {
  Apikey({
    required this.key,
    required this.value,
    required this.type,
  });

  String key;
  String value;
  String type;

  factory Apikey.fromJson(Map<String, dynamic> json) => Apikey(
        key: json["key"],
        value: json["value"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": type,
      };
}

class Event {
  Event({
    required this.listen,
    required this.script,
  });

  String listen;
  Script script;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        listen: json["listen"],
        script: Script.fromJson(json["script"]),
      );

  Map<String, dynamic> toJson() => {
        "listen": listen,
        "script": script.toJson(),
      };
}

class Script {
  Script({
    required this.type,
    required this.exec,
  });

  String type;
  List<String> exec;

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        type: json["type"],
        exec: List<String>.from(json["exec"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "exec": List<dynamic>.from(exec.map((x) => x)),
      };
}

class Info {
  Info({
    required this.postmanId,
    required this.name,
    required this.description,
    required this.schema,
  });

  String postmanId;
  String name;
  String description;
  String schema;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        description: json["description"],
        schema: json["schema"],
      );

  Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "description": description,
        "schema": schema,
      };
}

class ClickUpItem {
  ClickUpItem({
    required this.name,
    required this.item,
    this.description,
    this.event,
  });

  String name;
  List<ItemItem> item;
  String? description;
  List<Event>? event;

  factory ClickUpItem.fromJson(Map<String, dynamic> json) => ClickUpItem(
        name: json["name"],
        item:
            List<ItemItem>.from(json["item"].map((x) => ItemItem.fromJson(x))),
        description: json["description"],
        event: json["event"] == null
            ? []
            : List<Event>.from(json["event"]!.map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "description": description,
        "event": event == null
            ? []
            : List<dynamic>.from(event!.map((x) => x.toJson())),
      };
}

class ItemItem {
  ItemItem({
    required this.name,
    required this.request,
    required this.response,
    this.protocolProfileBehavior,
  });

  String name;
  Request request;
  List<dynamic> response;
  ProtocolProfileBehavior? protocolProfileBehavior;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        name: json["name"],
        request: Request.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
        protocolProfileBehavior: json["protocolProfileBehavior"] == null
            ? null
            : ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
        "protocolProfileBehavior": protocolProfileBehavior?.toJson(),
      };
}

class ProtocolProfileBehavior {
  ProtocolProfileBehavior({
    required this.disableBodyPruning,
  });

  bool disableBodyPruning;

  factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) =>
      ProtocolProfileBehavior(
        disableBodyPruning: json["disableBodyPruning"],
      );

  Map<String, dynamic> toJson() => {
        "disableBodyPruning": disableBodyPruning,
      };
}

class Request {
  Request({
    required this.method,
    required this.header,
    this.body,
    required this.url,
    this.description,
  });

  Method method;
  List<Header> header;
  Body? body;
  Url url;
  String? description;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        method: methodValues.map[json["method"]]!,
        header:
            List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        url: Url.fromJson(json["url"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "method": methodValues.reverse[method],
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "body": body?.toJson(),
        "url": url.toJson(),
        "description": description,
      };
}

class Body {
  Body({
    required this.mode,
    this.formdata,
    this.raw,
    this.options,
  });

  Mode mode;
  List<Formdatum>? formdata;
  String? raw;
  Options? options;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: modeValues.map[json["mode"]]!,
        formdata: json["formdata"] == null
            ? []
            : List<Formdatum>.from(
                json["formdata"]!.map((x) => Formdatum.fromJson(x))),
        raw: json["raw"],
        options:
            json["options"] == null ? null : Options.fromJson(json["options"]),
      );

  Map<String, dynamic> toJson() => {
        "mode": modeValues.reverse[mode],
        "formdata": formdata == null
            ? []
            : List<dynamic>.from(formdata!.map((x) => x.toJson())),
        "raw": raw,
        "options": options?.toJson(),
      };
}

class Formdatum {
  Formdatum({
    required this.key,
    required this.type,
    required this.src,
  });

  String key;
  String type;
  List<dynamic> src;

  factory Formdatum.fromJson(Map<String, dynamic> json) => Formdatum(
        key: json["key"],
        type: json["type"],
        src: List<dynamic>.from(json["src"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type,
        "src": List<dynamic>.from(src.map((x) => x)),
      };
}

enum Mode { FORMDATA, RAW }

final modeValues = EnumValues({"formdata": Mode.FORMDATA, "raw": Mode.RAW});

class Options {
  Options({
    required this.raw,
  });

  Raw raw;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        raw: Raw.fromJson(json["raw"]),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw.toJson(),
      };
}

class Raw {
  Raw({
    required this.language,
  });

  Language language;

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
      };
}

enum Language { JSON }

final languageValues = EnumValues({"json": Language.JSON});

class Header {
  Header({
    required this.key,
    this.name,
    required this.value,
    this.type,
    this.disabled,
  });

  Key key;
  Key? name;
  Value value;
  Type? type;
  bool? disabled;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: keyValues.map[json["key"]]!,
        name: keyValues.map[json["name"]]!,
        value: valueValues.map[json["value"]]!,
        type: typeValues.map[json["type"]]!,
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "key": keyValues.reverse[key],
        "name": keyValues.reverse[name],
        "value": valueValues.reverse[value],
        "type": typeValues.reverse[type],
        "disabled": disabled,
      };
}

enum Key { EMPTY, CONTENT_TYPE }

final keyValues = EnumValues({"Content-Type": Key.CONTENT_TYPE, "": Key.EMPTY});

enum Type { TEXT }

final typeValues = EnumValues({"text": Type.TEXT});

enum Value { EMPTY, APPLICATION_JSON }

final valueValues =
    EnumValues({"application/json": Value.APPLICATION_JSON, "": Value.EMPTY});

enum Method { POST, GET, PUT, DELETE }

final methodValues = EnumValues({
  "DELETE": Method.DELETE,
  "GET": Method.GET,
  "POST": Method.POST,
  "PUT": Method.PUT
});

class Url {
  Url({
    required this.raw,
    required this.protocol,
    required this.host,
    required this.path,
    this.query,
  });

  String raw;
  Protocol protocol;
  List<Host> host;
  List<String> path;
  List<Query>? query;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json["raw"],
        protocol: protocolValues.map[json["protocol"]]!,
        host: List<Host>.from(json["host"].map((x) => hostValues.map[x]!)),
        path: List<String>.from(json["path"].map((x) => x)),
        query: json["query"] == null
            ? []
            : List<Query>.from(json["query"]!.map((x) => Query.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "protocol": protocolValues.reverse[protocol],
        "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
        "path": List<dynamic>.from(path.map((x) => x)),
        "query": query == null
            ? []
            : List<dynamic>.from(query!.map((x) => x.toJson())),
      };
}

enum Host { API, CLICKUP, COM }

final hostValues =
    EnumValues({"api": Host.API, "clickup": Host.CLICKUP, "com": Host.COM});

enum Protocol { HTTPS }

final protocolValues = EnumValues({"https": Protocol.HTTPS});

class Query {
  Query({
    required this.key,
    required this.value,
    this.disabled,
  });

  String key;
  String value;
  bool? disabled;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        key: json["key"],
        value: json["value"],
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "disabled": disabled,
      };
}

class Variable {
  Variable({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
