package org.wraith_project.wraith;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.bsf.BSFManager;

/**
 * Hello world!
 *
 */
public class App {

  private static final String RUBY         = "RUBY".intern();
  private static final String RB           = "rb".intern();
  private static final String JRUBY_ENGINE = "org.jruby.javasupport.bsf.JRubyEngine".intern();
  private static final String BOOT_FILE    = "server.rb".intern();
  private static final String DEBUG_FILE   = "wraith/server.rb".intern();

  public static void main(String[] args) {
    int DEBUG = 1;
    try {
      BSFManager.registerScriptingEngine(RUBY, JRUBY_ENGINE, new String[] { RB });
      BSFManager manager = new BSFManager();
      if (DEBUG == 1) {
        manager.exec(RUBY, BOOT_FILE, -1, -1, getScriptFromFile(DEBUG_FILE));
      } else {
        manager.exec(RUBY, BOOT_FILE, -1, -1, getScriptFromResource(BOOT_FILE));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private static String getScriptFromFile(String file) throws IOException {
    BufferedReader reader = new BufferedReader(new FileReader(new File("lib/" + file)));
    StringBuilder script = new StringBuilder();

    while (true) {
      String line = reader.readLine();
      if (line == null)
        break;
      script.append(line);
      script.append('\n');
    }

    reader.close();
    return script.toString();
  }

  private static String getScriptFromResource(String resource) throws IOException {
    BufferedReader reader = new BufferedReader(new InputStreamReader(
              App.class.getResourceAsStream("/resources/" + resource)));

    StringBuilder script = new StringBuilder();

    while (true) {
      String line = reader.readLine();
      if (line == null)
        break;
      script.append(line);
      script.append('\n');
    }

    return script.toString();
  }
}
