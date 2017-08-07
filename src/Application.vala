/*
* Copyright (c) 2011-2017 Alecaddd (http://alecaddd.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Alessandro "Alecaddd" Castellani <castellani.ale@gmail.com>
*/
namespace Sequeler { 
    public Sequeler.Window window;
}

public class Sequeler.Application : Granite.Application {

    public const string PROGRAM_NAME = "Sequeler";
    public const string ABOUT_STOCK = "About Sequeler";

    // Avoid multiple instances
    public bool running = false;

    construct {
        flags |= ApplicationFlags.HANDLES_OPEN;
        application_id = "com.github.alecaddd.sequeler";
        program_name = PROGRAM_NAME;
        app_launcher = "com.github.alecaddd.sequeler";
        exec_name = "com.github.alecaddd.sequeler";
        app_launcher = application_id + ".desktop";
    }

    protected override void activate () {

        if (!running) {
            window = new Sequeler.Window (this);
            this.add_window (window);

            running = true;
        }

        window.show_app ();

    }
}