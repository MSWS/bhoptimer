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

Database gH_SQL = null;

// table prefix
char gS_MySQLPrefix[32];

public Plugin myinfo =
{
  name = "[shavit] Reporting System",
  author = "MSWS",
  description = "Create and handle record reports",
  version = SHAVIT_VERSION,
	url = "https://github.com/shavitush/bhoptimer"
};

public void LoadReports(const char[] map)
{
  
}

public void Shavit_OnDatabaseLoaded()
{
  gH_SQL = Shavit_GetDatabase();
}