---
title: "Privacy Ppolicy"
date: "2006-04-14 00:00:00"
type: "sample"
layout: "privacy-policy"
showDate: false
showAuthor: false
showEdit: false
showPagination: false
showReadingTime: false
showRelatedContent: false
showWordCount: false
showComments: false
sharingLinks: false
showZenMode: true
aliases:
    - /en/privacy
    - /en/privacypolicy
---

{{< alert >}}
The original document is in Chinese, translated from ChatGPT.
{{< /alert >}}

> Welcome to our products.

## Introduction

Welcome to our products. qladgk.com (hereinafter referred to as "Website" or "Products and Services") is developed and operated by qlAD (hereinafter referred to as "we"). We attach great importance to the data security and privacy protection of users. This Privacy Policy is intended to explain to you the types of data we collect and how we process them when you access and use our products and services.

We understand the importance of your privacy to you. When you use our services, we may collect and use your relevant information. Through this Privacy Policy, we hope to clearly explain to you how we collect, use, store and share this information, as well as how you can access, update, control and protect your personal information. Please read this policy carefully and make the choices you think are appropriate based on this policy when necessary. We have tried to express the relevant technical terms in simple and easy-to-understand language and provide links to further explanations to help you understand.

**By using or continuing to use our services, you agree that we collect, use, store and share your relevant information in accordance with this Privacy Policy. **

If you have any questions about this Privacy Policy or related matters, please contact us at [qlad.adgk.1024@gmail.com](mailto:qlad.adgk.1024@gmail.com).

This Privacy Policy helps you understand the following:

- Information we may collect
- How we may use information
- How you can access and control your personal information
- Information we may share
- Information security
- Information you share
- Sensitive personal information you share
- How we may collect information
- Advertising services
- Emails and information we may send to you
- Applicable exceptions to the Privacy Policy
- Minors use our services
- Scope of application of the Privacy Policy
- Changes

## Information we may collect

When providing services, we may collect, store and use the following information about you:

- This website does not use statistical systems such as Google Analytics and Umami.
- Giscus comment system will read your GitHub information based on your **active submission**:
- Read metadata permission
- Read and write discussion permission

If you do not provide relevant information, it will not affect your experience of browsing this site.

**The following is the public information you may provide when browsing this site:**

| Type           | Information                         |
| -------------- | ----------------------------------- |
| **IP Address** | <span id="userAgentIp"></span>      |
| **Country**    | <span id="userAgentCountry"></span> |
| **Province**   | <span id="userAgentRegion"></span>  |
| **City**       | <span id="userAgentCity"></span>    |
| **Carrier**    | <span id="userAgentIsp"></span>     |
| **Device**     | <span id="userAgentDevice"></span>  |

<script>
    // 获取ip
    function getIpInfo() {
        var fetchUrl = "https://api.qjqq.cn/api/Local"
        fetch(fetchUrl).then(res => res.json()).then(json => {
            var country = json.country;
            var ip = json.ip;
            var province = json.province;
            var city = json.city;
            var isp = json.isp;
            document.getElementById("userAgentIp").innerHTML = ip;
            document.getElementById("userAgentCountry").innerHTML = json.data.country;
            document.getElementById("userAgentRegion").innerHTML = json.data.prov;
            document.getElementById("userAgentCity").innerHTML = json.data.city;
            document.getElementById("userAgentIsp").innerHTML = json.data.isp;
            var uaInfo = navigator.userAgent;
            document.getElementById("userAgentDevice").innerHTML = uaInfo;
        }
        )
    }

    getIpInfo()
</script>

## How we may use information

We may use the information collected in the process of providing services for the following purposes:

1. **Provide services**:
- Identity authentication, customer service, security prevention, fraud monitoring, archiving and backup to ensure the security of the products and services we provide.
- Help us design new services and improve existing services.
- Better understand how you access and use our services, so as to more accurately meet your personalized needs, such as language settings, location settings, personalized help services and instructions.
- Provide you with more relevant ads instead of general ads.
- Evaluate the effectiveness of advertising and other promotional activities in our services and improve them.
- Manage software certification or software upgrades.
- Invite you to participate in surveys about our products and services.

2. **Improve user experience**:
- Subject to compliance with laws and regulations, information collected through a service may be used for our other services. For example, information collected when using one of our services may be used in another service to provide you with specific content or display information related to you.

## How you access and control your personal information

We will do everything possible to take appropriate technical measures to ensure that you can access, update and correct your registration information or other personal information provided when using our services. When accessing, updating, correcting and deleting this information, we may ask you to authenticate your identity to ensure the security of your account.

## Information we may share

We and our affiliates will not share your personal information with any third party without your consent, except in the following circumstances:

- Share with our affiliates, partners and third-party service providers, contractors and agents (such as service providers responsible for sending emails or push notifications) in order to:
- Provide our services;
- Achieve the relevant purposes of how we may use information;
- Fulfill our obligations and exercise our rights in the User Agreement or this Privacy Policy;
- Understand, maintain and improve our services.

We will strive to ensure that these third parties comply with this Privacy Policy and other appropriate confidentiality and security measures we require them to comply with when using your personal information.

As our business continues to develop, we and our affiliates may engage in mergers, acquisitions, asset transfers or similar transactions, and your personal information may be transferred as part of such transactions. We will notify you before the transfer.

We or our affiliates may also retain, store or disclose your personal information for the following purposes:

- Comply with applicable laws and regulations;
- Comply with court orders or other legal procedures;
- Comply with the requirements of relevant government agencies;
- Purposes that are reasonably necessary to comply with applicable laws and regulations, safeguard the public interest, and protect the safety and legal rights of our customers or us or our group companies, other users or employees.

## Information Security

We only retain your personal information for the period necessary for the purposes described in this Privacy Policy and the time limit required by laws and regulations.

We use a variety of security technologies and procedures to prevent the loss, improper use, unauthorized access or disclosure of information. For example, in some services, we use encryption technology (such as SSL) to protect the personal information you provide. However, please understand that although we have tried our best to strengthen security measures, due to technical limitations and potential malicious means, the Internet industry cannot achieve 100% information security. You need to understand that the system and communication network you use to access our services may have problems due to factors beyond our control.

## Information you share

Many of our services allow you to share information about you with your social network and all users of the service, such as information you upload or post in our services (including personal information you make public and lists you create), your responses to information uploaded or posted by others, and location information and log information related to such information. Other users may also share information about you (including location data and log information). In particular, our social media services are designed to allow you to share information with users around the world, and you can widely disseminate shared information in real time. As long as you do not delete the shared information, the relevant information will continue to remain in the public domain; even if you delete the shared information, the relevant information may still be cached, copied or stored independently by other users or third parties not controlled by us.

**Therefore, please carefully consider the content of the information you upload, post and communicate through our services. ** In some cases, you can control which users can see the information you share through the privacy settings of the service. To delete the relevant information from our services, please follow the instructions provided in the specific service terms.

## Sensitive personal information you share

Some personal information may be considered sensitive personal information due to its special nature, such as your race, religious beliefs, health and medical information, etc. Sensitive personal information is more strictly protected.

Please note that the content you provide, upload or publish when using our services (such as photos of social activities) may reveal your sensitive personal information. Therefore, you need to carefully consider whether to disclose relevant sensitive personal information when using our services.

**You agree to process your sensitive personal information in accordance with the purposes and methods described in this Privacy Policy. **

## How we may collect information

We or our third-party partners may collect and use your information through cookies and web beacons and store this information as log information.

We use our own cookies and web beacons, as well as cookies and web beacons of third parties, to improve our service experience, conduct research, analysis, optimize services and provide advertising services. Cookies are small text files stored on your computer that allow us to recognize your browser and restore your preferences when you visit again. Web beacons are small image files embedded in web pages or emails, which are usually used to track user visits. You can set your browser to accept cookies or reject cookies according to your needs. Please note that if you choose to reject cookies, you may not be able to use some of our services or features.

When accessing our products and services, you can manage cookies by setting your browser. To protect privacy and security, please check and manage your cookies regularly to ensure that they meet your personal needs.

## Advertising Services

We may work with third-party advertisers and advertising networks to provide you with relevant advertising services. In the process, these advertisers may use cookies, web beacons and other similar technologies to collect information about your visits to our services and other websites. This enables them to provide more personalized advertising content based on your visit behavior and preferences. Our products may contain advertisements from third-party advertising networks and third-party websites or information content from other sources, and we are not responsible for the content, privacy policies and practices of these advertisements and websites.

## Emails and information we may send to you

When you use our services, you may receive information and emails from us, including but not limited to:

- Welcome email after you register an account;

- Responses to your questions or feedback;

- Updates on products and services;

- Special events, offers or promotions.

You can set up according to the information we provide and choose whether to receive relevant emails or information.

## Exceptions to the Privacy Policy

In some cases, we may use your personal information in a manner that is inconsistent with this Privacy Policy, such as in the following circumstances:

- As required by laws and regulations;
- As required by legal procedures;
- As required by government requests;
- In the context of legal proceedings related to the services and activities you participate in.

We will take appropriate measures to protect your personal information when processing information in accordance with the requirements of applicable laws.

## Use of our services by minors

Our services are not intended for minors. If you are a minor, you should use our services under the guidance and consent of your parents or guardians. Minors are not allowed to register an account or provide us with personal information. If we learn that a minor has provided us with personal information without the consent of his or her parents or guardians, we will take reasonable measures to delete the relevant information as soon as possible.

## Scope of application of the Privacy Policy

This Privacy Policy applies to all personal information we collect during your use of our services. As we continue to improve our products and services, we may update this policy from time to time. In this case, we will publish the updated privacy policy and indicate the update date.

## Changes

We may update this privacy policy from time to time. If we make significant changes to this privacy policy, we will notify you through the website or other appropriate means.

Thank you for using qladgk.com. If you have any questions or suggestions about this privacy policy, please contact us.
