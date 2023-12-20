class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _items.removeLast();
  }

  bool get isEmpty => _items.isEmpty;
}

void printListInReverse(List<dynamic> list) {
  Stack<dynamic> stack = Stack();

  // Push elements onto the stack
  for (var element in list) {
    stack.push(element);
  }

  // Pop elements from the stack and print them
  while (!stack.isEmpty) {
    print(stack.pop());
  }
}


bool areParenthesesBalanced(String input) {
  Stack<String> stack = Stack();

  for (var char in input.runes.map((rune) => String.fromCharCode(rune))) {
    if (char == '(') {
      stack.push(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false; // Unmatched closing parenthesis
      }
      stack.pop();
    }
  }

  return stack.isEmpty; // If the stack is empty, parentheses are balanced
}



class Node {
  var data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void append(var data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void printReverse() {
    _printReverseHelper(head);
  }

  void _printReverseHelper(Node? node) {
    if (node == null) {
      return;
    }

    _printReverseHelper(node.next);
    print(node.data);
  }

  Node? findMiddleNode() {
    if (head == null) {
      return null;
    }

    Node? slowPointer = head;
    Node? fastPointer = head;

    while (fastPointer != null && fastPointer.next != null) {
      slowPointer = slowPointer!.next;
      fastPointer = fastPointer.next!.next;
    }

    return slowPointer;
  }

  void reverse() {
    Node? prev = null;
    Node? current = head;
    Node? nextNode;

    while (current != null) {
      nextNode = current.next; // Save the next node
      current.next = prev;      // Reverse the link
      prev = current;           // Move prev to the current node
      current = nextNode;       // Move current to the next node
    }

    head = prev; // The last node becomes the new head
  }


  void removeOccurrences(var target) {
    while (head != null && head!.data == target) {
      head = head!.next;
    }

    Node? current = head;

    while (current != null && current.next != null) {
      if (current.next!.data == target) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
  }
}



void main() {
  //Challenge 1: Reverse a List
  List<int> exampleList = [1, 2, 3, 4, 5];

  print('Original List: $exampleList');
  print('List in Reverse Order: ');
  printListInReverse(exampleList);

  // Balance the Parentheses
  String unbalancedString = '(()(())';
  print('Is balanced: ${areParenthesesBalanced(unbalancedString)}');

  //Print in Reverse
  LinkedList linkedList = LinkedList();
  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);

  print('Original Linked List:');
  linkedList.printList();
  print('\nLinked List in Reverse Order:');
  linkedList.printReverse();

  // Find the Middle Node
  Node? middleNode = linkedList.findMiddleNode();
  if (middleNode != null) {
    print('\nMiddle Node: ${middleNode.data}');
  } else {
    print('\nList is empty.');
  }


  // Reverse a Linked List
  print('Original Linked List:');
  linkedList.printList();
  linkedList.reverse();
  print('\nReversed Linked List:');
  linkedList.printList();


//Remove All Occurrences
  linkedList.removeOccurrences(2);
  print('\nLinked List after removing 2:');
  linkedList.printList();

}
