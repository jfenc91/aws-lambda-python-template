import unittest
import mock
from lambdas.hello_world import hello_world
from StringIO import StringIO

class TestHelloWorld(unittest.TestCase):
    @mock.patch('sys.stdout', new_callable=StringIO)
    def testLambdaHandler(self, mock_stdout):
        hello_world.lambda_handler({'resources':['sometriggerENVdevENV']},{})
        self.assertEquals(mock_stdout.getvalue(), "hello dev\n")