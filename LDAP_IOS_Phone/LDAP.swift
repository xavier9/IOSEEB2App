//
//  Ldap.swift
//  LDAP_IOS_Phone
//
//  Created by administrator on 06/04/16.
//  Copyright © 2016 administrator. All rights reserved.
//

import Foundation

class Ldap: NSObject {
    func ldap(){
        let ld: ldapmod;
        //NSLog("attempting %s bind:", (caFile ? "TLS simple" : "simple"));
        let ldapURI = "uid=47657,ou=Users,dc=eeb2,dc=be";
        NSLog("   initialzing LDAP (%s)...", ldapURI);
        var err = ldap_initialize(nil, ldapURI);
        if (err != LDAP_SUCCESS)
        {
            NSLog("   ldap_initialize(): %s\n", ldap_err2string(err));
            return  ;
        };
        
        var version = LDAP_VERSION3;
        NSLog("   setting protocol version %i...", version);
        err = ldap_set_option(ld, LDAP_OPT_PROTOCOL_VERSION, &version);
        if (err != LDAP_SUCCESS)
        {
            NSLog("   ldap_set_option(): %s\n", ldap_err2string(err));
            ldap_unbind_ext_s(ld, nil, nil);
            return ;
        };
        

        
        NSLog("   Bind Data:");
        NSLog("      Mech:    Simple");

        
       /* NSLog("   binding to LDAP server...");
        err = ldap_sasl_bind_s(ld, bindDN, LDAP_SASL_SIMPLE, &cred, NULL, NULL, &servercredp);
        if (err != LDAP_SUCCESS)
        {
            NSLog("   ldap_sasl_bind_s(): %s", ldap_err2string(err));
            ldap_unbind_ext_s(ld, nil, nil);
            return ldap_err2string(err);
        };
        
        
        NSLog("   initiating lookup...");
        if ((err = ldap_search_ext_s(ld, baseDN, scope, filter, NULL, 0, NULL, NULL, NULL, -1, &res)))
        {
            NSLog("   ldap_search_ext_s(): %s", ldap_err2string(err));
            ldap_unbind_ext_s(ld, nil, nil);
            return  ldap_err2string(err);
        };
        
        NSLog("   checking for results...");
        if (!(ldap_count_entries(ld, res)))
        {
            NSLog("   no entries found.");
            ldap_msgfree(res);
            ldap_unbind_ext_s(ld, nil, nil);
            return  ldap_err2string(err);
        };
        NSLog("   %i entries found.", ldap_count_entries(ld, res));
        
        NSLog("   retrieving results...");
        if (!(entry = ldap_first_entry(ld, res)))
        {
            NSLog("   ldap_first_entry(): %s", ldap_err2string(err));
            ldap_msgfree(res);
            ldap_unbind_ext_s(ld, NULL, NULL);
            return  ldap_err2string(err);
        };
        
        NSLog("   initiating lookup...");
        if ((err = ldap_search_ext_s(ld, baseDN, scope, filter, NULL, 0, NULL, NULL, NULL, -1, &res)))
        {
            NSLog("   ldap_search_ext_s(): %s", ldap_err2string(err));
            ldap_unbind_ext_s(ld, nil, nil);
            return ldap_err2string(err);
        };
        
        NSLog("   checking for results...");
        if (!(ldap_count_entries(ld, res)))
        {
            NSLog("   no entries found.");
            ldap_msgfree(res);
            ldap_unbind_ext_s(ld, NULL, NULL);
            return ldap_err2string(err);
        };
        NSLog("   %i entries found.", ldap_count_entries(ld, res));
        
        NSLog("   retrieving results...");
        //ldapm = entry;
        int j = 0;
        while(entry)
        {
            NSLog(" ");
            NSLog("      dn: %s", ldap_get_dn(ld, entry));
            
            var attribute = ldap_first_attribute(ld, entry, &ber);
            
            while(attribute)
            {
                
                if (vals = ldap_get_values_len(ld, entry, attribute))
                {
                    
                    for(var i = 0; vals[i]; i++){
                        
                        
                        
                        
                        NSLog("      %s: %s", attribute, vals[i]);
                    }
                    
                    ldap_value_free_len(vals);
                };
                ldap_memfree(attribute);
                attribute = ldap_next_attribute(ld, entry, ber);
            };
            //ldapArray[j] = entry;
            // skip to the next entry
            entry = ldap_next_entry(ld, entry);
            j++;
        };
        
        
        NSLog(" ");
        */
        NSLog("   unbinding from LDAP server...");
        ldap_unbind_ext_s(ld, nil, nil);
    }
}