//
//  CompanyDirectoryAPIClient.h
//  Company Directory
//
//  Created by Mattt Thompson on 11/12/10.
//  Copyright (c) 2011年 Gowalla. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CompanyDirectoryAPIClient : AFHTTPClient

+ (CompanyDirectoryAPIClient *)sharedClient;

@end
