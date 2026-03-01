import asyncio
from fastmcp import Client
from rich import print


async def main():
    client = Client("http://localhost:8000/sse")

    async with client:
        get_all_tools = await client.list_tools()
        print("Available Tools:", get_all_tools)
        return get_all_tools
    
if __name__ == "__main__":
    asyncio.run(main())