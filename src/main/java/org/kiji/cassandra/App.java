package org.kiji.cassandra;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.Host;
import com.datastax.driver.core.Metadata;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;

/**
 * Hello world!
 *
 */
public class App {

  private Cluster cluster;
  private Session session;

  /** Connect to the cluster. */
  public void connect(String node) {
    cluster = Cluster.builder().addContactPoint(node).build();
    Metadata metadata = cluster.getMetadata();
    System.out.println("Cluster: " + metadata.getClusterName());
    for ( Host host : metadata.getAllHosts() ) {
      System.out.println("Host: " + host);
    }
  }

  public static void main(String[] args) {
    System.out.println( "Hello World!" );
    App app = new App();
    app.connect("127.0.0.1");
    app.close();
  }

  public void close() { cluster.shutdown(); }
}
