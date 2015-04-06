using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace ECTFinalProject.code
{
    public class SecuredPassword
    {
        public static String GenerateHash(String password)
        {
            //WARNING: This code does not reflect best practice.  It is a simplistic implementation designed to introduce the concept of hashing.
            password = "$$$$$" + password + "$#!%^";
            var pwdBytes = Encoding.UTF8.GetBytes(password);

            SHA256 hashAlg = new SHA256Managed();
            hashAlg.Initialize();
            var hashedBytes = hashAlg.ComputeHash(pwdBytes);
            var hash = Convert.ToBase64String(hashedBytes);
            return hash;
        }
    }
}