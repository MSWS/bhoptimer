/*
 * shavit's Timer - Chat
 * by: shavit, Nairda, GAMMA CASE, Kid Fearless, rtldg, BoomShotKapow
 *
 * This file is part of shavit's Timer (https://github.com/shavitush/bhoptimer)
 *
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, version 3.0, as published by the
 * Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#include <sourcemod>
#include <shavit/core>
#include <shavit/reports>

Database gH_SQL = null;

// table prefix
char gS_MySQLPrefix[32];

// cache
ArrayList gH_Reports;

public Plugin myinfo =
{
  name = "[shavit] Reporting System",
  author = "MSWS",
  description = "Create and handle record reports",
  version = SHAVIT_VERSION,
	url = "https://github.com/shavitush/bhoptimer"
};

public void OnPluginStart()
{
  gH_Reports = new ArrayList(sizeof(report_t));
}

public void OnMapStart()
{
  char map[PLATFORM_MAX_PATH];
  GetCurrentMap(map, sizeof(map));
  LoadReports(map);
}

public void LoadReports(const char[] map)
{
  char sQuery[512];
  FormatEx(sQuery, sizeof(sQuery), "SELECT * FROM %sreports WHERE `map` = '%s'", gS_MySQLPrefix, map);
  QueryLog(gH_SQL, SQL_LoadedReports, sQuery);
}

public void SQL_LoadedReports(Database db, DBResultSet results, const char[] error, DataPack hPack)
{
	if(results == null)
	{
		LogError("Timer error! Failed to load report data. Reason: %s", error);
		return;
	}

  while (results.FetchRow())
  {
    report_t report;
    report.recordId = results.FetchInt(0);
    report.reporter = results.FetchInt(1);
    report.reported = results.FetchInt(2);
    results.FetchString(3, report.reason, sizeof(report.reason));
    gH_Reports.PushArray(report);
  }
  
}

public void Shavit_OnDatabaseLoaded()
{
  GetTimerSQLPrefix(gS_MySQLPrefix, sizeof(gS_MySQLPrefix));
  gH_SQL = Shavit_GetDatabase();
}