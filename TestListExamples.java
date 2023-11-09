import static org.junit.Assert.*;
import org.junit.*;

import java.beans.Transient;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, ListExamples.merge(left, right));
  }

  @Test(timeout = 500) 
  public void testMerge2() {
    List<String> list1 = Arrays.asList("boy", "dang", "darn", "kid");
    List<String> list2 = Arrays.asList("ale", "apple", "autumn", "baby", "dingus", "zebra");
    List<String> expected = Arrays.asList("ale", "apple", "autumn", "baby", "boy", "dang", "darn", "dingus", "kid", "zebra");
    assertEquals(expected, ListExamples.merge(list1, list2));
  }

  @Test(timeout = 500) 
  public void testFilterMoon() {
    IsMoon checker = new IsMoon();
    List<String> initString = Arrays.asList("moon", "MOOn", "notMoon", "MoOn");
    List<String> expected = Arrays.asList("moon", "MOOn", "MoOn");
    assertEquals(expected, ListExamples.filter(initString, checker));
  }
  
}
