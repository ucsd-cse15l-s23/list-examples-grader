import static org.junit.Assert.*;
import org.junit.*;
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
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test 
  public void testMerge_differentLengths() {
    List<String> left = Arrays.asList("Cheetos", "Goldfish", "Cheeseits");
    List<String> right = Arrays.asList("Donald");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("Cheeseits", "Cheetos", "Donald", "Goldfish");
    assertEquals(expected, merged);
  }
  @Test 
  public void testMerge_differentLength2() {
    List<String> right = Arrays.asList("Cheetos", "Goldfish", "Cheeseits");
    List<String> left = Arrays.asList("Donald");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("Cheeseits", "Cheetos", "Donald", "Goldfish");
    assertEquals(expected, merged);
  }

  @Test 
  public void testMerge_capitalization() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("A", "B", "C");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("A", "B", "C", "a", "b", "c");
    assertEquals(expected, merged);
  }

  @Test
  public void testMerge_duplicates() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "b", "b");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "b", "b", "c");
    assertEquals(expected, merged);
  }
}

// hello world
