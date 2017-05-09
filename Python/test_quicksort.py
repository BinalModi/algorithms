#!/Users/gcallah/anaconda/bin/python3
"""
Test our sorting code.
"""

from unittest import TestCase, main
from Quicksort.quicksort import quicksort
from utils.test_utils import rand_list


class QuicksortTestCase(TestCase):

    def test_quicksort(self):
        for j in range(10):
            l = rand_list(max_list=100)

            # no return!
            quicksort(l)

            for i in range(0, len(l) - 1):
                self.assertLessEqual(l[i], l[i + 1])

if __name__ == '__main__':
    main()
