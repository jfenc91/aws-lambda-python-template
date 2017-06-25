import re


def lambda_handler(event, context):
    sourceArn = event['resources'][0]
    envMatch = re.search('.*ENV(.*)ENV.*', sourceArn)

    print("hello {}".format(envMatch.group(1)))

