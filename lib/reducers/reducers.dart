Map getUserInfo(Map userInfo, dynamic action) {
  if (action.type == 'SETUSERINFO') {
    userInfo = action.userInfo;
  } else if (action.type == 'GETUSERINFO') {}
  print(action.type);
  return userInfo;
}
