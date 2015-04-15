//
//  UPRDataManager.m
//  seguridad-upr
//
//  Created by Xiomara on 3/29/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//

#import "UPRDataManager.h"

@implementation UPRDataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleAlert = @"UPR Seguridad";
        _inactiveMessage = @"Tu cuenta no ha sido activada, verifica tu email";
        _invalidMessage = @"Este email ya está en uso";
        _generalMessage = @"Hubo un error, verifica tus credenciales y tu conexión al internet";
        _actionMessage = @"Por favor activa tu cuenta, verifica tu correo electrónico y sigue las instrucciones";
        _activeTitle = @"ACTIVA TU CUENTA";
    }
    return self;
}

#pragma mark - Singleton Methods

+ (instancetype)sharedManager
{
    static id sharedInstance = nil;
    sharedInstance = [[[self class] alloc] init];
    
    return sharedInstance;
}

@end
