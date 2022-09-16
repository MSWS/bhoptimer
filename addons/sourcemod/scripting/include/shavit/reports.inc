enum struct report_t
{
  int recordId;
  int reporter;
  int reported;
  char reporterName[MAX_NAME_LENGTH];
  char reason[128];
}