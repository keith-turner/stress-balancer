package accumulo.balancer;

import org.apache.accumulo.core.data.KeyExtent;

import com.google.common.base.Function;

public class StressBalancer extends GroupBalancer {

  public StressBalancer(String tableId) {
    super(tableId);
  }

  @Override
  protected Function<KeyExtent,String> getPartitioner() {
    return new Function<KeyExtent,String>() {

      @Override
      public String apply(KeyExtent input) {
        if (input.getEndRow() == null) {
          return "08";
        }

        return input.getEndRow().toString().substring(0, 2);
      }
    };
  }

}
