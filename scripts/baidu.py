import sys
import requests
from lxml import etree

def submit_to_baidu(api_url, urls):
    """
    Submit the URLs to Baidu.
    :param api_url: The API URL for Baidu submission.
    :param urls: A list of URLs to submit.
    :return: Response text from Baidu.
    """
    headers = {
        'User-Agent': 'curl/7.80.0',
        'Host': 'data.zz.baidu.com',
        'Content-Type': 'text/plain',
        'Accept-Language': 'zh-CN,zh;q=0.9'
    }
    
    try:
        res = requests.post(api_url, headers=headers, data='\n'.join(urls))
        res.raise_for_status()  # Raises an HTTPError if the HTTP request returned an unsuccessful status code
        return res.text
    except requests.exceptions.RequestException as e:
        print(f"Error submitting to Baidu: {e}")
        sys.exit(1)

def get_urls(sitemap_path):
    """
    Get the URLs from the sitemap.
    :param sitemap_path: The path to the sitemap file.
    :return: A list of URLs.
    """
    try:
        tree = etree.parse(sitemap_path)
    except (etree.XMLSyntaxError, OSError) as e:
        print(f"Error parsing the sitemap file: {e}")
        sys.exit(1)

    namespaces = {'sitemap': 'http://www.sitemaps.org/schemas/sitemap/0.9'}
    urls = tree.xpath("//sitemap:loc/text()", namespaces=namespaces)

    if not urls:
        print("No URLs found in the sitemap.")
        sys.exit(1)

    return urls

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: python baidu.py <sitemap_path> <api_url>")
        sys.exit(1)

    sitemap_path = sys.argv[1]
    api_url = sys.argv[2]

    urls = get_urls(sitemap_path)
    print("URLs to be submitted:")
    print('\n'.join(urls))

    response = submit_to_baidu(api_url, urls)
    print("Response from Baidu:")
    print(response)
