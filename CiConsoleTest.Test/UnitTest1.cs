using System;
using Xunit;
using CiConsoleTest;

namespace CiConsoleTest.Test
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            var pit = new Ping();

            var result = pit.Handle($"Ping");

            Assert.Equal("Pong", result);
        }
    }
}
