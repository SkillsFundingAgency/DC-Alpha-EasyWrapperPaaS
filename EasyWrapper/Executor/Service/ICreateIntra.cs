﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyWrapper.Executor.Service
{
    public interface ICreateIntra
    {
        void Create(string year, string instanceName, string security, Action<string> logger, Action<string> errorHandler);
    }
}
