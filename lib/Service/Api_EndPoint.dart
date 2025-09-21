class ApiEndPoints {
  static ModLogin modLogin = ModLogin();
  static ChecklistMod checklistMod = ChecklistMod();
  static CheckSession cekSession = CheckSession();
  static GetReport getReport = GetReport();
  static GetVersion getversion = GetVersion();
  static BmData bmData = BmData();
}

class GetVersion {
  final String version = '/Mod/ReadVersionmod';
}

class ModLogin {
  final String getToken = '/Loginmod/Authorize';
  final String login = '/Loginmod/Users';
}

class ChecklistMod {
  final String getListMod = '/Mod/ListPekerjaanMOD';
  final String getListDetail = '/Mod/ListPekerjaanMODDETAIL';
  final String postDetail = '/Mod/SumbitMOD';
  //final String getModbyDate = '/Mod/ListFilterpekerjaanMOD';
  final String updatePostDetail = '/Mod/UpdatetrxMOD';
  final String statusUnit = '/Mod/Liststatusbmbyunit';
  final String getModbyId = '/Mod/ListFilterTRXMOD';
  final String updateStatusTRX = '/Mod/UpdateMOD';
  final String getUnit = '/Mod/ListUnitMOD';
  final String deleteTrx = '/Mod/DeleteMODTRX';
}

class CheckSession {
  final String postSession = '/Mod/InsertSession';
  final String getSession = '/Mod/ListSessionMOD';
  final String updateSession = '/Mod/UpdatesessionMOD';
  final String deleteSession = '/Mod/DeletesessionMOD';
}

class GetReport {
  final String getReport = '/Mod/ListModDone';
}

class BmData {
  final String getbyunit = '/Mod/Listbmbyunit';
}
