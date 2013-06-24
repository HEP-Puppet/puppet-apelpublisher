define apelpublisher::db_permissions ($host = $title) {
  database_grant { "apel@${host}/apelclient": privileges => [
      'all'], }
}