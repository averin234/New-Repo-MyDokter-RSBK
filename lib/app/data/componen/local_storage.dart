import 'package:mydokter_rsbk/app/data/componen/data_regist_model.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mydokter_rsbk/app/data/model/login_and_regist/token.dart';

class LocalStorages {
  static GetStorage boxToken = GetStorage('token_adokter');
  static GetStorage boxDataRegist = GetStorage('dataRegist_adokter');
  static Future<void> setToken(Token token) async {
    Token tokens = getToken;
    await boxToken.erase();
    await boxToken.write('code', token.code ?? tokens.code);
    await boxToken.write('token', token.token ?? tokens.token);
    Publics.controller.getToken.value = LocalStorages.getToken;
    return;
  }

  static Future<void> setDataRegist(DataRegist dataRegist) async {
    final getdata = getDataRegist;
    await boxDataRegist.write(
      'kode',
      dataRegist.kode ?? getdata.kode,
    );
    await boxDataRegist.write(
      'password',
      dataRegist.password ?? getdata.password,
    );
    await boxDataRegist.write(
      'email',
      dataRegist.email ?? getdata.email,
    );
    await boxDataRegist.write(
      'ingat_saya',
      dataRegist.ingatSaya ?? getdata.ingatSaya,
    );
    Publics.controller.getDataRegist.value = LocalStorages.getDataRegist;
    return;
  }

  static Token get getToken => Token.fromJson(boxToken.listenable.value);

  static DataRegist get getDataRegist =>
      DataRegist.fromJson(boxDataRegist.listenable.value);
}
